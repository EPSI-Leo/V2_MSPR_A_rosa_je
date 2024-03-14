using System;
using System.Collections.Generic;
using Arosaje.ModelViews;
using Microsoft.EntityFrameworkCore;

namespace Arosaje.Entities;

public partial class Arosaje2Context : DbContext
{
    public Arosaje2Context()
    {
    }

    public Arosaje2Context(DbContextOptions<Arosaje2Context> options)
        : base(options)
    {
    }

    public virtual DbSet<Advice> Advices { get; set; }

    public virtual DbSet<Plant> Plants { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    { }
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Advice>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("advices");

            entity.HasIndex(e => e.IdUser, "id_user");

            entity.Property(e => e.Advice1)
                .HasColumnType("text")
                .HasColumnName("advice");
            entity.Property(e => e.Id)
                .HasMaxLength(191)
                .HasColumnName("id");
            entity.Property(e => e.IdPlant)
                .HasMaxLength(191)
                .HasColumnName("id_plant");
            entity.Property(e => e.IdUser)
                .HasMaxLength(191)
                .HasColumnName("id_user");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .HasColumnName("name");
        });

        modelBuilder.Entity<Plant>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("plants");

            entity.Property(e => e.BeginAt)
                .HasColumnType("date")
                .HasColumnName("beginAt");
            entity.Property(e => e.Description)
                .HasColumnType("text")
                .HasColumnName("description");
            entity.Property(e => e.EndAt)
                .HasColumnType("date")
                .HasColumnName("endAt");
            entity.Property(e => e.Id)
                .HasMaxLength(191)
                .HasColumnName("id");
            entity.Property(e => e.IdUser)
                .HasMaxLength(191)
                .HasColumnName("id_user");
            entity.Property(e => e.Latitude).HasColumnName("latitude");
            entity.Property(e => e.Longitude).HasColumnName("longitude");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .HasColumnName("name");
            entity.Property(e => e.Picture).HasColumnName("picture");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("users");

            entity.Property(e => e.Id)
                .HasMaxLength(191)
                .HasColumnName("id");
            entity.Property(e => e.Cgu).HasColumnName("CGU");
            entity.Property(e => e.Password)
                .HasMaxLength(100)
                .HasColumnName("password");
            entity.Property(e => e.Role)
                .HasMaxLength(20)
                .HasColumnName("role");
            entity.Property(e => e.Username)
                .HasMaxLength(255)
                .HasColumnName("username");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
